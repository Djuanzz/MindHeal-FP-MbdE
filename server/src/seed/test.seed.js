import fs from "fs";

const userSeeds = [
  {
    name: "admin",
    email: "admin@gmail.com",
    password: "admin123",
    role: "admin",
  },
];

const colors = [
  "merah",
  "biru",
  "hijau",
  "kuning",
  "putih",
  "pink",
  "hitam",
  "coklat",
  "krem",
  "ungu",
  "abuabu",
  "oranye",
  "emas",
  "perak",
  "hijautua",
  "merahmuda",
  "birutua",
  "kuningtua",
  "putihsusu",
  "hitamtua",
];

for (let i = 0; i < 100000; i++) {
  const color = colors[i % colors.length];
  const user = {
    name: `warna${color}${i + 1}`,
    email: `warna${color}${i + 1}@gmail.com`,
    password: `warna${color}aja123`,
    role: "user",
  };
  userSeeds.push(user);
}

fs.writeFileSync("userSeeds.json", JSON.stringify(userSeeds, null, 2));

console.log("User seeds have been saved to userSeeds.json");
