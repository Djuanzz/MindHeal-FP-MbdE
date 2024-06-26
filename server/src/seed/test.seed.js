import fs from "fs";

const userSeeds = [
  {
    Name: "admin",
    Email: "admin@gmail.com",
    Password: "admin123",
    DateOfBirth: "1990-01-01",
    Address: "Jl. Sudirman No. 1",
    City: "Jakarta",
    Mobile: "081234567890",
    Role: "Admin",
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

const cityMaps = {
  1: "Jakarta",
  2: "Bandung",
  3: "Surabaya",
  4: "Semarang",
  5: "Yogyakarta",
  6: "Bali",
  7: "Lombok",
  8: "Makassar",
  9: "Manado",
  10: "Medan",
};

for (let i = 0; i < 500; i++) {
  const color = colors[i % colors.length];
  const user = {
    Name: `warna${color}${i + 1}`,
    Email: `warna${color}${i + 1}@gmail.com`,
    Password: `warna${color}123`,
    DateOfBirth: "2000-01-01",
    Address: `Jalan warna ${color} no ${i + 1}`,
    City: cityMaps[(i % 10) + 1],
    Mobile: `08${i}234${i}78${i}`,
    Role: "User",
  };
  userSeeds.push(user);
}

fs.writeFileSync("userSeeds.json", JSON.stringify(userSeeds, null, 2));

console.log("User seeds have been saved to userSeeds.json");
